function [aeroForces] = paramSpace_4_2_4_3_1_2_3(sailStates,airStates)

	CL = (3.844714)*sailStates.alpha + (0.089548)*sailStates.beta + (-2.715242)*sailStates.p + (37.572838)*sailStates.q + (1.225765)*sailStates.r + (0.010625)*sailStates.de;
	CD = 0.078750;
	CY = (-0.049363)*sailStates.alpha + (-0.025775)*sailStates.beta + (0.352212)*sailStates.p + (-0.684402)*sailStates.q + (-0.070133)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.375427)*sailStates.alpha + (-0.120847)*sailStates.beta + (-1.375076)*sailStates.p + (12.115828)*sailStates.q + (0.901478)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-13.325354)*sailStates.alpha + (-0.349149)*sailStates.beta + (8.798136)*sailStates.p + (-141.172913)*sailStates.q + (-4.130849)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.184448)*sailStates.alpha + (0.029134)*sailStates.beta + (-0.525989)*sailStates.p + (1.823138)*sailStates.q + (-0.020447)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end