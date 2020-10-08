FROM jupyterhub/singleuser

USER root
RUN apt-get update && apt-get install -y git build-essential graphviz libgts-dev

USER jovyan
RUN conda install -c alubbock pysb
RUN conda install -c conda-forge python-igraph
RUN conda install cython matplotlib pandas

RUN pip install magine


# old api version of simplepso
RUN pip install simplepso==2.1.1

RUN git clone https://github.com/lolab-vu/magine
RUN python magine/magine/copy_sample_dbs.py
RUN mkdir pysb && cd pysb && git clone https://github.com/lolab-vu/pysb-tutorials

RUN pip install git+git://github.com/lolab-vu/earm
