import service.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CalculadoraSwing {

    public static void main(String[] args) {
        JFrame frame = new JFrame("Calculadora Gráfica");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 600);
        frame.setLayout(new GridLayout(6, 2, 10, 10));

        JLabel label1 = new JLabel("Número 1:");
        JTextField num1 = new JTextField();

        JLabel label2 = new JLabel("Número 2:");
        JTextField num2 = new JTextField();

        JLabel resultadoLabel = new JLabel("Resultado:");
        JTextField resultado = new JTextField();
        resultado.setEditable(false);

        JButton botonSuma = new JButton("Sumar");
        JButton botonResta = new JButton("Restar");
        JButton botonMultiplicar = new JButton("Multiplicar");
        JButton botonDividir = new JButton("Dividir");

        ActionListener listener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    double a = Double.parseDouble(num1.getText());
                    double b = Double.parseDouble(num2.getText());
                    Operacion operacion = null;

                    if (e.getSource() == botonSuma) {
                        operacion = new Suma();
                    } else if (e.getSource() == botonResta) {
                        operacion = new Resta();
                    } else if (e.getSource() == botonMultiplicar) {
                        operacion = new Multiplicacion();
                    } else if (e.getSource() == botonDividir) {
                        operacion = new Division();
                    }

                    if (operacion != null) {
                        double res = OperacionService.operar(operacion, a, b);
                        resultado.setText(String.valueOf(res));
                    }

                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(frame, "Por favor ingresa números válidos.");
                } catch (ArithmeticException ex) {
                    JOptionPane.showMessageDialog(frame, ex.getMessage());
                }
            }
        };

        botonSuma.addActionListener(listener);
        botonResta.addActionListener(listener);
        botonMultiplicar.addActionListener(listener);
        botonDividir.addActionListener(listener);

        frame.add(label1);
        frame.add(num1);
        frame.add(label2);
        frame.add(num2);
        frame.add(botonSuma);
        frame.add(botonResta);
        frame.add(botonMultiplicar);
        frame.add(botonDividir);
        frame.add(resultadoLabel);
        frame.add(resultado);

        frame.setVisible(true);
    }
}