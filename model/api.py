import sqlalchemy as sa

from sqlalchemy.orm import Mapped, mapped_column

from backend.common.model import Base, id_key


class Api(Base):
    """API 表"""

    __tablename__ = 'sys_api'
    __table_args__ = (
        sa.UniqueConstraint('name', 'deleted', name='uk_sys_api_name_deleted'),
        {'comment': 'API 表'},
    )

    id: Mapped[id_key] = mapped_column(init=False)
    name: Mapped[str] = mapped_column(sa.String(50), comment='API 名称')
    method: Mapped[str] = mapped_column(sa.String(16), comment='请求方法')
    path: Mapped[str] = mapped_column(sa.String(500), comment='API 路径')
    remark: Mapped[str | None] = mapped_column(sa.Text, comment='备注')
