using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UnijorgeDesafio.Models
{
    [Table("Usuario")]
    public class Usuario
    {
        [Display(Name ="Id")]
        [Column("Id")]
        public int Id { get; set; }

        [Display(Name ="NomeCompleto")]
        [Column("NomeCompleto")]
        public string NomeCompleto { get; set; }

        [Display(Name = "CPF")]
        [Column("CPF")]
        public string CPF { get; set; }

        [Display(Name = "Telefone")]
        [Column("Telefone")]
        public string Telefone { get; set; }

        [Display(Name = "Email")]
        [Column("Email")]
        public string Email { get; set; }

        [Display(Name = "Data")]
        [Column("Data")]
        public DateTime Data { get; set; }

        [Display(Name = "Ativo")]
        [Column("Ativo")]
        public string Ativo { get; set; }
    }
}
