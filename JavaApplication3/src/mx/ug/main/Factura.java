/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.main;

/**
 *
 * @author bruja1
 */
public class Factura {
    public String nombreCliente;
    public String entrada;
    public String especialidad;
    public String tipoEspecialidad;
    public String postre;

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getTipoEspecialidad() {
        return tipoEspecialidad;
    }

    public void setTipoEspecialidad(String tipoEspecialidad) {
        this.tipoEspecialidad = tipoEspecialidad;
    }

    public String getPostre() {
        return postre;
    }

    public void setPostre(String postre) {
        this.postre = postre;
    }

    @Override
    public String toString() {
        return "Factura{" + "nombreCliente=" + nombreCliente + ", entrada=" + entrada + ", especialidad=" + especialidad + ", tipoEspecialidad=" + tipoEspecialidad + ", postre=" + postre + '}';
    }
    
}
