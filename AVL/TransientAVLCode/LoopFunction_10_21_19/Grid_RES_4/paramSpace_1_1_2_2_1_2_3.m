function [aeroForces] = paramSpace_1_1_2_2_1_2_3(sailStates,airStates)

	CL = (3.639714)*sailStates.alpha + (-0.209094)*sailStates.beta + (-2.870615)*sailStates.p + (38.215958)*sailStates.q + (-0.945729)*sailStates.r + (0.010631)*sailStates.de;
	CD = 0.094600;
	CY = (-0.083569)*sailStates.alpha + (-0.023290)*sailStates.beta + (-0.154895)*sailStates.p + (-0.455225)*sailStates.q + (-0.030794)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.296089)*sailStates.alpha + (0.026837)*sailStates.beta + (-1.533143)*sailStates.p + (13.449835)*sailStates.q + (-0.662140)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-13.082101)*sailStates.alpha + (0.784912)*sailStates.beta + (9.614223)*sailStates.p + (-145.756378)*sailStates.q + (3.208256)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.364352)*sailStates.alpha + (0.011266)*sailStates.beta + (0.090665)*sailStates.p + (1.078841)*sailStates.q + (-0.053066)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end