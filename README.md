# Digital Image Processing Uricer

Programa para disciplina de Processamento Digital de Imagens 02/2016

Detectar pontos de esclerose no cérebro e mostrar essa informação de uma maneira legível.
Converter imagens axiais para sagitais e coronais.

#### Métodos

##### ImageCv.create_coronal

Cria os arquivos do ângulo coronal das imagens baseado nos dados do axial.

Exemplo:
```ruby
ImageCv.create_coronal
```
Arquivo Original:

![Arquivo Original](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/mri_flair_axial100.png)

Imagem Produzida:

![Imagem Produzida](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/mri_flair_coronal40.png)

##### ImageCv.create_sagital

Cria os arquivos do ângulo sagital das imagens baseado nos dados do axial.

Exemplo:
```ruby
ImageCv.create_sagital
```
Arquivo Original:

![Arquivo Original](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/mri_flair_axial100.png)

Imagem Produzida:

![Imagem Produzida](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/sagital100.png)

##### ImageCv.esclerosis_detection(threshold, save_binary_file)

Detecta os pontos de esclerose baseado em um limite (threshold) dado, salva arquivos binários de detecção caso configurado.

Exemplo:
```ruby
# threshold: 0-255
# save_binary_file: true/false
ImageCv.esclerosis_detection(150, false)
```

Arquivo Original:

![Arquivo Original](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/mri_flair_axial100.png)

Threshold 150:

![Threshold 150](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/esclerose100t150.png)

Threshold 127:

![Threshold 127](https://raw.githubusercontent.com/leonardofalk/digital-image-processing-uricer/master/esclerose100t127.png)

# ToDo

- [ ] Refatorar código para usar de forma mais programática.
- [ ] Renderizar os dados usando alguma biblioteca gráfica.

# Dependências

- [ruby-opencv](https://github.com/ruby-opencv/ruby-opencv)
- [opencv](https://github.com/opencv/opencv)
