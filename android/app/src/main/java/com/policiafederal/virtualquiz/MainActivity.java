package com.policiafederal.virtualquiz;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.view.ContextThemeWrapper;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.provider.Settings;

public class MainActivity extends FlutterActivity {

    private static final String channel = "com.policiafederal.virtualquiz/general";
    private static MethodChannel channelObject;
    private static final int MY_PERMISSIONS_REQUEST_CAMERA = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        initializeChannels();
    }

    private void initializeChannels() {
        channelObject = new MethodChannel(getFlutterView(), channel);

        channelObject.setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("openVideo")) {
                            String caseColor = call.argument("caseColor").toString();
                            try {
                                System.out.println("Case color is: " + caseColor);
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("/storage/emulated/0/casos/" + caseColor + ".mp4"));
                                intent.setDataAndType(Uri.parse("/storage/emulated/0/casos/" + caseColor + ".mp4"), "video/*");
                                startActivity(intent);
                            } catch (Exception e) {
                            }
                        } else if (call.method.equals("scanQRCode")) {
                            if (isCheckCameraPermission()) {
                                startActivity(new Intent(MainActivity.this, SimpleScannerActivity.class));
                            }
                        }

                        result.success(1);
                    }
                });
    }


    @Override
    public void onBackPressed() {

        AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.permissionsDialog));


        builder.setMessage("¿Seguro que desea salir de la aplicación?")
                .setTitle("Salir");

        builder.setPositiveButton("Salir", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                // User clicked OK button
                MainActivity.super.onBackPressed();
            }
        });
        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
            }
        });

        AlertDialog dialog = builder.create();

        dialog.show();

    }

    public static void searchClue(String text) {
        channelObject.invokeMethod("handleText", text);
    }

    public boolean isCheckCameraPermission() {

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.CAMERA) !=
                PackageManager.PERMISSION_GRANTED) {

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA)) {
                showMessageOKCancelCamera("Debes permitir el acceso a la cámara del dispositivo");
                return false;
            }

            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.CAMERA},
                    MY_PERMISSIONS_REQUEST_CAMERA);
            return false;
        }

        return true;

    }

    private void showMessageOKCancelCamera(String message) {
        new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.myDialog))
                .setMessage(message)
                .setPositiveButton("Aceptar", listenerCamera)
                .setNegativeButton("Cancelar", listenerCamera)
                .create()
                .show();
    }

    DialogInterface.OnClickListener listenerCamera = new DialogInterface.OnClickListener() {

        final int BUTTON_NEGATIVE = -2;
        final int BUTTON_POSITIVE = -1;

        @Override
        public void onClick(DialogInterface dialog, int which) {
            switch (which) {
                case BUTTON_NEGATIVE:
                    // int which = -2
                    dialog.dismiss();
                    break;

                case BUTTON_POSITIVE:
                    // int which = -1
                    ActivityCompat.requestPermissions(
                            MainActivity.this, new String[]{Manifest.permission.CAMERA},
                            MY_PERMISSIONS_REQUEST_CAMERA);
                    dialog.dismiss();
                    break;
            }
        }
    };

    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[], int[] grantResults) {
        switch (requestCode) {

            case MY_PERMISSIONS_REQUEST_CAMERA: {

                for (int i = 0, len = permissions.length; i < len; i++) {
                    String permission = permissions[i];

                    if (permission.equals(Manifest.permission.CAMERA)) {

                        if (grantResults[i] == PackageManager.PERMISSION_DENIED) {
                            boolean showRationale = ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_FINE_LOCATION);
                            if (!showRationale) {

                                AlertDialog.Builder builder = new AlertDialog.Builder(new ContextThemeWrapper(this, R.style.myDialog));

                                builder.setTitle("Permite la utilización de la cámara");

                                builder.setMessage("Debes conceder permiso para utilizar la cámara del dispositivo.\n\n" +
                                        "Para esto, haz click en \"Configuración de la App\" abajo y activa Cámara en el menú permisos.")

                                        .setPositiveButton("Configuración de la App", new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {

                                                Intent intent = new Intent();
                                                intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                                                intent.addCategory(Intent.CATEGORY_DEFAULT);
                                                intent.setData(Uri.parse("package:" + getBaseContext().getPackageName()));
                                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                                intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
                                                intent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
                                                getBaseContext().startActivity(intent);

                                            }
                                        })

                                        .setNegativeButton("Ahora no", new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {
                                            }
                                        });

                                AlertDialog cameraFinalDialog = builder.create();
                                cameraFinalDialog.show();

                            }
                        }
                    }
                }

            }
        }
    }
}
