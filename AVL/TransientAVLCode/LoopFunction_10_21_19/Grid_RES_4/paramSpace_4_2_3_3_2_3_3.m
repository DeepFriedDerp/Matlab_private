function [aeroForces] = paramSpace_4_2_3_3_2_3_3(sailStates,airStates)

	CL = (4.133101)*sailStates.alpha + (0.128216)*sailStates.beta + (-2.780350)*sailStates.p + (39.772667)*sailStates.q + (1.753065)*sailStates.r + (0.011180)*sailStates.de;
	CD = -0.183360;
	CY = (0.036751)*sailStates.alpha + (-0.025190)*sailStates.beta + (0.562954)*sailStates.p + (-0.194783)*sailStates.q + (-0.111985)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.406914)*sailStates.alpha + (-0.234209)*sailStates.beta + (-1.400228)*sailStates.p + (12.703075)*sailStates.q + (1.388215)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-12.618450)*sailStates.alpha + (-0.481485)*sailStates.beta + (8.543526)*sailStates.p + (-141.871536)*sailStates.q + (-5.848971)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.280009)*sailStates.alpha + (0.054173)*sailStates.beta + (-1.029470)*sailStates.p + (3.789660)*sailStates.q + (-0.015984)*sailStates.r + (0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end