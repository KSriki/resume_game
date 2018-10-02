const input = document.querySelector('input')

input.addEventListener('keydown', function(e) {
  if (e.which === 89 || w.which === 121) {
    alert('this should link to sessions#new')
  }
})
