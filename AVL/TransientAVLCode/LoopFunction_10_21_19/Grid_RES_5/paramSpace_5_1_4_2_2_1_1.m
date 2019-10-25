function [aeroForces] = paramSpace_5_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.302244)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.355841)*sailStates.p + (34.348621)*sailStates.q + (-1.119656)*sailStates.r + (0.011157)*sailStates.de;
	CD = -0.155330;
	CY = (0.077652)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.403064)*sailStates.p + (0.322046)*sailStates.q + (-0.042330)*sailStates.r + (0.000069)*sailStates.de;

	Cl = (1.262663)*sailStates.alpha + (0.188557)*sailStates.beta + (-1.029817)*sailStates.p + (8.476310)*sailStates.q + (-0.882720)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.322610)*sailStates.alpha + (0.000000)*sailStates.beta + (7.686864)*sailStates.p + (-130.700150)*sailStates.q + (3.746118)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (-0.245543)*sailStates.alpha + (0.019818)*sailStates.beta + (0.825084)*sailStates.p + (-3.827872)*sailStates.q + (0.005009)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end