FROM jupyterhub/singleuser

RUN conda install -c alubbock pysb
RUN conda install cython matplotlib pandas

RUN pip install magine

USER root
RUN apt-get update && apt-get install -y git build-essential
USER jovyan

RUN git clone https://github.com/lolab-vu/magine
RUN python magine/scripts/download_databases.py
RUN mkdir pysb && cd pysb && git clone https://github.com/lolab-vu/pysb-tutorials
