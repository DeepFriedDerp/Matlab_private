function [aeroForces] = paramSpace_1_4_2_2_1_2_3(sailStates,airStates)

	CL = (3.639713)*sailStates.alpha + (0.209094)*sailStates.beta + (-2.870614)*sailStates.p + (38.215961)*sailStates.q + (-0.945729)*sailStates.r + (0.010631)*sailStates.de;
	CD = 0.094600;
	CY = (-0.083569)*sailStates.alpha + (-0.026282)*sailStates.beta + (-0.154895)*sailStates.p + (-0.455225)*sailStates.q + (-0.030794)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.174133)*sailStates.alpha + (0.158686)*sailStates.beta + (-1.438770)*sailStates.p + (12.261954)*sailStates.q + (-0.643326)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-13.082102)*sailStates.alpha + (-0.784912)*sailStates.beta + (9.614222)*sailStates.p + (-145.756409)*sailStates.q + (3.208256)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.314168)*sailStates.alpha + (0.025636)*sailStates.beta + (0.109436)*sailStates.p + (0.842557)*sailStates.q + (-0.049323)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end