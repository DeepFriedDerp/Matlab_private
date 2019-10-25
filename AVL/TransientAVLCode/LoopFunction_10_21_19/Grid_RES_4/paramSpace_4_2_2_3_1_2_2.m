function [aeroForces] = paramSpace_4_2_2_3_1_2_2(sailStates,airStates)

	CL = (3.958591)*sailStates.alpha + (0.071139)*sailStates.beta + (-2.466057)*sailStates.p + (35.338444)*sailStates.q + (1.107500)*sailStates.r + (0.010676)*sailStates.de;
	CD = 0.044280;
	CY = (-0.063163)*sailStates.alpha + (-0.025480)*sailStates.beta + (0.292261)*sailStates.p + (-0.489619)*sailStates.q + (-0.058117)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.280825)*sailStates.alpha + (-0.102429)*sailStates.beta + (-1.170039)*sailStates.p + (10.129694)*sailStates.q + (0.771619)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-13.811302)*sailStates.alpha + (-0.244623)*sailStates.beta + (8.008680)*sailStates.p + (-134.148560)*sailStates.q + (-3.694520)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.042596)*sailStates.alpha + (0.024803)*sailStates.beta + (-0.458573)*sailStates.p + (1.749817)*sailStates.q + (-0.016036)*sailStates.r + (0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end