namespace UsuariosApi.Entities;

public class Usuario
{
    public int Id { get; set; }

    public string Nombre { get; set; } = string.Empty;

    public string Apellido { get; set; } = string.Empty;

    public string Correo { get; set; } = string.Empty;

    // La contraseña NO se guarda en texto plano
    public string PasswordHash { get; set; } = string.Empty;

    // Reemplazar Edad: la edad ahora se calcula a partir de esta fecha
    public DateOnly FechaNacimiento { get; set; }

    public string Universidad { get; set; } = string.Empty;

    // Semestre válido entre 1 y 10
   public int Semestre { get; set; }

    public bool Activo { get; set; } = true;

    public DateTime FechaCreacion { get; set; } = DateTime.Now;
}