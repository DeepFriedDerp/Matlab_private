function [aeroForces] = paramSpace_4_1_2_3_2_1_3(sailStates,airStates)

	CL = (3.878652)*sailStates.alpha + (0.054365)*sailStates.beta + (-2.662422)*sailStates.p + (34.796963)*sailStates.q + (0.414052)*sailStates.r + (0.010183)*sailStates.de;
	CD = -0.067580;
	CY = (-0.030084)*sailStates.alpha + (-0.025386)*sailStates.beta + (-0.059315)*sailStates.p + (-0.194783)*sailStates.q + (0.011805)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.346924)*sailStates.alpha + (0.068097)*sailStates.beta + (-1.391595)*sailStates.p + (11.790979)*sailStates.q + (0.139060)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-14.298060)*sailStates.alpha + (-0.128972)*sailStates.beta + (9.356349)*sailStates.p + (-140.845245)*sailStates.q + (-1.424776)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.201330)*sailStates.alpha + (-0.014116)*sailStates.beta + (0.380024)*sailStates.p + (-2.488647)*sailStates.q + (-0.048248)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end