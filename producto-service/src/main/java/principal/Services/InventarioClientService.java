package principal.Services;

import com.pepe.inventario.grpc.InventarioServiceGrpc;
import com.pepe.inventario.grpc.StockRequest;
import com.pepe.inventario.grpc.StockResponse;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.stereotype.Service;

@Service
public class InventarioClientService {
    @GrpcClient("inventario-service")
    private InventarioServiceGrpc.InventarioServiceBlockingStub inventarioServiceBlockingStub;
    public int obtenerStockPorGrpc(Long idProducto) {
        StockRequest request = StockRequest.newBuilder().setProductoId(idProducto).build();
        StockResponse response = inventarioServiceBlockingStub.getStock(request);
        return response.getCantidad();
    }
}
