function [aeroForces] = paramSpace_2_1_3_2_3_1_2(sailStates,airStates)

	CL = (4.788416)*sailStates.alpha + (-0.321494)*sailStates.beta + (-2.565836)*sailStates.p + (35.944798)*sailStates.q + (-1.536753)*sailStates.r + (0.011128)*sailStates.de;
	CD = -0.605730;
	CY = (0.098817)*sailStates.alpha + (-0.025526)*sailStates.beta + (-0.668854)*sailStates.p + (0.769435)*sailStates.q + (-0.043812)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.671070)*sailStates.alpha + (0.200134)*sailStates.beta + (-1.251263)*sailStates.p + (10.648313)*sailStates.q + (-1.326605)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.380569)*sailStates.alpha + (1.200842)*sailStates.beta + (8.379099)*sailStates.p + (-135.788696)*sailStates.q + (5.188214)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.216304)*sailStates.alpha + (0.021835)*sailStates.beta + (1.413012)*sailStates.p + (-6.777481)*sailStates.q + (0.010982)*sailStates.r + (-0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end