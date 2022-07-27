using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace UnijorgeCalouros.Models
{
    public class Usuario
    {
        [Key]
        public Guid Id { get; set; }

        [Required(ErrorMessage = "Nome Completo é obrigatório.")]
        [MinLength(2)]
        [MaxLength(200)]
        [Display(Name ="Nome Completo")]
        public string NomeCompleto { get; set; }

        [Required(ErrorMessage = "Email é obrigatório.")]
        [EmailAddress]
        [DisplayName("E-mail")]
        public string Email { get; set; }

        [Required(ErrorMessage = "CPF é obrigatório.")]
        [DisplayFormat(DataFormatString = "{0:000\\.000\\.000-00}", ApplyFormatInEditMode = true)]
        [RegularExpression(@"^\d{3}\.\d{3}\.\d{3}-\d{2}$", 
         ErrorMessage = "Formato de CPF Inválido.")]
        public string CPF { get; set; }

        [Required(ErrorMessage = "Telefone é obrigatório.")]
        [RegularExpression(@"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$", 
         ErrorMessage = "Telefone Inválido.")]
        public string Telefone { get; set; }

        [Required(ErrorMessage = "Data é obrigatoria.")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date, ErrorMessage = "Data em formato inválido")]
        [Display(Name ="Criado em")]
        public DateTime Data { get; set; } = DateTime.Now;

        public bool Ativo { get; set; }
    }
}