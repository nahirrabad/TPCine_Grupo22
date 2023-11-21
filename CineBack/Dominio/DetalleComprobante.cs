namespace CineBack.Dominio
{
    public class DetalleComprobante
    {
        public int Id { get; set; }
        public double PrecioEntrada { get; set; }
        public Butaca Butaca { get; set; }

        public DetalleComprobante(double precioEntrada, Butaca butaca)
        {
            PrecioEntrada = precioEntrada;
            Butaca = butaca;
        }

        public DetalleComprobante()
        {
            
        }        
    }
}