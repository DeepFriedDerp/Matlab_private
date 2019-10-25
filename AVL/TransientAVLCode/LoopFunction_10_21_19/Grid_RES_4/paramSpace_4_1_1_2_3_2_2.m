function [aeroForces] = paramSpace_4_1_1_2_3_2_2(sailStates,airStates)

	CL = (3.815042)*sailStates.alpha + (0.146131)*sailStates.beta + (-2.484690)*sailStates.p + (34.816593)*sailStates.q + (0.772434)*sailStates.r + (0.010608)*sailStates.de;
	CD = 0.065160;
	CY = (0.093564)*sailStates.alpha + (-0.022615)*sailStates.beta + (0.078257)*sailStates.p + (0.756270)*sailStates.q + (-0.015648)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.214935)*sailStates.alpha + (-0.017239)*sailStates.beta + (-1.215858)*sailStates.p + (10.382638)*sailStates.q + (0.487546)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-13.838954)*sailStates.alpha + (-0.448884)*sailStates.beta + (8.382875)*sailStates.p + (-134.899979)*sailStates.q + (-2.590289)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.263263)*sailStates.alpha + (0.007279)*sailStates.beta + (-0.010736)*sailStates.p + (-1.179841)*sailStates.q + (-0.046907)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end