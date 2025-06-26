
package com.danny.assistent;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView tekst = new TextView(this);
        tekst.setText("Assistent draait!");
        setContentView(tekst);
    }
}
