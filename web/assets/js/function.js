/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
  // +++++++++++++++++TALOHA+++++++++++++++++++++
 var table = $('#tableEtab').DataTable({
          "paging": true,
          "pageLength": 15,
          "searching": true,
          "select": true
       });

//      var valeursSelectionnees = [];
//
//      table.on('draw', function() {
//          $('.form-check-input').off('change').on('change', function() {
//              var val = $(this).val();
//
//              if ($(this).is(':checked')) {
//                // Ajouter la valeur si elle n'est pas déjà dans le tableau
//                if (!valeursSelectionnees.includes(val)) {
//                  valeursSelectionnees.push(val);
//                }
//              } else {
//                // Retirer la valeur si décochée 
//                var index = valeursSelectionnees.indexOf(val);
//                if (index !== -1) {
//                  valeursSelectionnees.splice(index, 1);
//                } 
//              }
//
//            //  alert(valeursSelectionnees); // Affiche le tableau mis à jour
//              $('#etablissement').val(valeursSelectionnees);
//          });
//      });
//      $('.form-check-input').change(function() {
//          var val = $(this).val();
//
//        if ($(this).is(':checked')) {
//          // Ajouter la valeur si elle n'est pas déjà dans le tableau
//          if (!valeursSelectionnees.includes(val)) {
//            valeursSelectionnees.push(val);
//          }
//        } else {
//          // Retirer la valeur si décochée 
//          var index = valeursSelectionnees.indexOf(val);
//          if (index !== -1) {
//            valeursSelectionnees.splice(index, 1);
//          } 
//        }
//
//        //alert(valeursSelectionnees); // Affiche le tableau mis à jour
//        $('#etablissement').val(valeursSelectionnees);
//      });
  // +++++++++++++++++ETO FARANY +++++++++++++++++++
  // Tableau pour stocker les IDs sélectionnés
  var rows_selected = [];

  // Fonction pour mettre à jour la case "Tout sélectionner" en fonction des sélections
  function updateSelectAllCtrl() {
    var $selectAll = $('#selectAll');
    var totalRows = table.rows().count();
    var selectedRows = rows_selected.length;

    if (selectedRows === 0) {
      $selectAll.prop('checked', false).prop('indeterminate', false);
    } else if (selectedRows === totalRows) {
      $selectAll.prop('checked', true).prop('indeterminate', false);
    } else {
      $selectAll.prop('checked', false).prop('indeterminate', true);
    }
    var etab_list = $('#etablissement').val();
    
  }

  // Lorsqu'on clique sur une case individuelle
  $('#tableEtab tbody').on('change', '.ligneCheckbox', function() {
    var $row = $(this).closest('tr');
    var rowId = $(this).val();
    
    if (this.checked) {
      if ($.inArray(rowId, rows_selected) === -1) {
        rows_selected.push(rowId);
      }
    } else {
      var index = $.inArray(rowId, rows_selected);
      if (index !== -1) {
        rows_selected.splice(index, 1);
      }
    }
    $('#etablissement').val(rows_selected);
    updateSelectAllCtrl();
  });

  // Lorsqu'on clique sur la case "Tout sélectionner"
  $('#selectAll').on('change', function() {
    var checked = this.checked;

    // Sélectionner/désélectionner toutes les lignes visibles
    $('input.ligneCheckbox', table.rows({page:'current'}).nodes()).prop('checked', checked);

    // Mettre à jour la liste rows_selected
    table.rows().every(function() { 
      var $checkbox = $(this.node()).find('input.ligneCheckbox');
      var rowId = $checkbox.val();  
      //var rowId = $(this).val(); alert("1");//$(this.node()).data('id').toString();
      if (checked) { 
        if ($.inArray(rowId, rows_selected) === -1) {
          rows_selected.push(rowId);
        }
      } else { 
        var index = $.inArray(rowId, rows_selected);
        if (index !== -1) {
          rows_selected.splice(index, 1);
        }
      } 
      $('#etablissement').val(rows_selected);
    });

    updateSelectAllCtrl();
  });

  // Lorsqu'on change de page, mettre à jour les cases en fonction de rows_selected
  table.on('draw', function() {
    // Cocher les cases des lignes sélectionnées
    table.rows({page:'current'}).every(function() {
      var rowId = $(this).val(); //$(this.node()).data('id').toString();
      var $checkbox = $(this.node()).find('input.ligneCheckbox');
      if ($.inArray(rowId, rows_selected) !== -1) {
        $checkbox.prop('checked', true);
      } else {
        $checkbox.prop('checked', false);
      }
    });

    updateSelectAllCtrl();
  });
});
