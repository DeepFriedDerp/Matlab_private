function [aeroForces] = paramSpace_2_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.379080)*sailStates.alpha + (-2.826594)*sailStates.beta + (-6.592528)*sailStates.p + (77.113487)*sailStates.q + (5.938691)*sailStates.r + (0.014686)*sailStates.de;
	CD = -9.698200;
	CY = (4.020646)*sailStates.alpha + (-0.026934)*sailStates.beta + (2.405547)*sailStates.p + (0.441959)*sailStates.q + (-0.316540)*sailStates.r + (0.000098)*sailStates.de;

	Cl = (-2.037163)*sailStates.alpha + (-2.044392)*sailStates.beta + (-4.314618)*sailStates.p + (40.932266)*sailStates.q + (5.384767)*sailStates.r + (0.005457)*sailStates.de;
	Cm = (14.659506)*sailStates.alpha + (11.383608)*sailStates.beta + (19.321270)*sailStates.p + (-240.654694)*sailStates.q + (-20.131800)*sailStates.r + (-0.079563)*sailStates.de;
	Cn = (-15.433682)*sailStates.alpha + (0.153562)*sailStates.beta + (-4.847597)*sailStates.p + (18.762085)*sailStates.q + (-0.000460)*sailStates.r + (0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end