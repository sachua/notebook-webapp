FROM cschranz/gpu-jupyter:v1.4_cuda-11.0_ubuntu-20.04_python-only
USER root

RUN rm -rf /etc/jupyter/jupyter_notebook_config.json
RUN conda install "nbconvert = 5.6.1"

COPY --chown=${NB_UID}:${NB_GID} ./requirements.txt /tmp
RUN pip install --requirement /tmp/requirements.txt --no-cache-dir

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

COPY ./SF_crimes.csv ./SF_crimes.csv
COPY ./Voila_example.ipynb ./Voila_example.ipynb