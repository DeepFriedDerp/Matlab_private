function [aeroForces] = paramSpace_1_4_2_2_2_1_1(sailStates,airStates)

	CL = (4.400053)*sailStates.alpha + (0.430529)*sailStates.beta + (-2.150730)*sailStates.p + (35.337204)*sailStates.q + (-1.849724)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.483700;
	CY = (0.071220)*sailStates.alpha + (-0.025775)*sailStates.beta + (-0.647971)*sailStates.p + (-0.301042)*sailStates.q + (-0.128879)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.083614)*sailStates.alpha + (0.446390)*sailStates.beta + (-0.813284)*sailStates.p + (7.126884)*sailStates.q + (-1.495133)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-11.749119)*sailStates.alpha + (-1.635824)*sailStates.beta + (6.184945)*sailStates.p + (-122.964470)*sailStates.q + (6.154955)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.555615)*sailStates.alpha + (0.063765)*sailStates.beta + (1.356077)*sailStates.p + (-5.502003)*sailStates.q + (0.004461)*sailStates.r + (-0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end