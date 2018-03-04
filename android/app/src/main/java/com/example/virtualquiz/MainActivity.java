package com.example.virtualquiz;

import android.os.Bundle;
import android.app.AlertDialog;
import android.view.ContextThemeWrapper;
import android.content.DialogInterface;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
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
        // User cancelled the dialog
      }
    });

    AlertDialog dialog = builder.create();

    dialog.show();
  }
}
