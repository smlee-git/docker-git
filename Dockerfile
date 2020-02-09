# Base Image
FROM jupyter/base-notebook

# Maintainer
LABEL maintainer "Shiho ASA"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    NB_USER=dojin

# Install Jupyter Notebook and Hub
RUN conda install --quiet --yes \
    'numpy=1.16.*' \
    'scipy=1.2.*' \
    'sympy=1.5.*' \
    'matplotlib=3.1.*' \
    && conda clean -tipsy && \
    fix-permissions $CONDA_DIR

# Install Sample Notebook
COPY sample_notebook/CavityFlow_with_Navier-Stokes.ipynb /home/$NB_USER/
