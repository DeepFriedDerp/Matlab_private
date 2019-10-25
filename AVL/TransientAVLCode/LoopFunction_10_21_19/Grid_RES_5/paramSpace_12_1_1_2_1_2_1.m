function [aeroForces] = paramSpace_12_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.291620)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.341491)*sailStates.p + (34.760307)*sailStates.q + (1.280875)*sailStates.r + (0.011146)*sailStates.de;
	CD = -0.159180;
	CY = (-0.077548)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.436378)*sailStates.p + (-0.291853)*sailStates.q + (-0.061298)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.262829)*sailStates.alpha + (-0.206480)*sailStates.beta + (-1.021037)*sailStates.p + (8.597507)*sailStates.q + (0.990948)*sailStates.r + (0.000043)*sailStates.de;
	Cm = (-13.985548)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.467561)*sailStates.p + (-130.037888)*sailStates.q + (-4.271211)*sailStates.r + (-0.068518)*sailStates.de;
	Cn = (0.235229)*sailStates.alpha + (0.029019)*sailStates.beta + (-0.875917)*sailStates.p + (3.929245)*sailStates.q + (0.003693)*sailStates.r + (0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end