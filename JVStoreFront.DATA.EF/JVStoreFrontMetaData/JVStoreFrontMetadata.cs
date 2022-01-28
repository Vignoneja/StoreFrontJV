using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace JVStoreFront.DATA.EF//.JVStoreFrontMetaData
{

    #region Products Metadata

    public class ProductsMetadata
    {
        [Display(Name = "Game Title : ")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string ProductTitle { get; set; }

        [Display(Name = "Game Description : ")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string ProductDesc { get; set; }

        [Display(Name = "Released Date : ")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public Nullable<System.DateTime> ReleaseDate { get; set; }

        [Required(ErrorMessage = "*")]
        [Range(0, double.MaxValue, ErrorMessage = "* Must be a valid number 0 or larger")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "-[N/A]-")]        
        public decimal Price { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public int Quantity { get; set; }

        [Display(Name = "Game Image")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string GameImage { get; set; }

        [Display(Name = "Units Sold : ")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public int UnitsSold { get; set; }        
    }

    [MetadataType(typeof(ProductsMetadata))]
    public partial class Product
    {

    }
    #endregion

    #region ESRB Metadata

    public class ESRBMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "ESRB Rating : ")]
        public string ESRBName { get; set; }
    }
    [MetadataType(typeof(ESRBMetadata))]
    public partial class ESRB
    {

    }
    #endregion    

    #region Publisher Metadata
    public class PublisherMetadata
    {
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Cannot exceed 50 characters")]
        [Display(Name = "Publisher Name : ")]
        public string PublisherName { get; set; }
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string City { get; set; }
        [StringLength(2, ErrorMessage = "* Value must be 2 characters")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string State { get; set; }
        [Display(Name = "Is Active")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(PublisherMetadata))]
    public partial class Publisher
    {

    }
    #endregion

    #region NumPlayer Metadata

    public class NumPlayerMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Number of Players : ")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string NumPlayers { get; set; }
    }
    [MetadataType(typeof(NumPlayerMetadata))]
    public partial class NumPlayer
    {

    }
    #endregion

    #region StockStatus Metadata

    public class StockStatusMetaData
    {
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Cannot exceed 50 characters")]
        [Display(Name = "Stock Status : ")]
        public string StockStatusName { get; set; }
        [StringLength(100, ErrorMessage = "* Cannot exceed 100 characters")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Notes { get; set; }
    }
    [MetadataType(typeof(StockStatusMetaData))]
    public partial class StockStatus
    {

    }
    #endregion

    #region MediaType Metadata

    public class MediaTypeMetaData
    {
        [StringLength(50, ErrorMessage = "* Cannot exceed 50 characters")]
        [Display(Name = "Type of Media : ")]
        public string MediaType1 { get; set; }
    }
    [MetadataType(typeof(MediaTypeMetaData))]
    public partial class MediaType
    {

    }
    #endregion
}
