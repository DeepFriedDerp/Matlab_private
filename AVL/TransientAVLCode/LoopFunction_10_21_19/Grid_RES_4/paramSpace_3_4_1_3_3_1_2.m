function [aeroForces] = paramSpace_3_4_1_3_3_1_2(sailStates,airStates)

	CL = (4.259402)*sailStates.alpha + (0.133256)*sailStates.beta + (-2.535481)*sailStates.p + (33.869801)*sailStates.q + (-0.464688)*sailStates.r + (0.010763)*sailStates.de;
	CD = -0.209530;
	CY = (0.060488)*sailStates.alpha + (-0.025160)*sailStates.beta + (-0.336123)*sailStates.p + (0.498142)*sailStates.q + (0.021978)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.267560)*sailStates.alpha + (0.177797)*sailStates.beta + (-1.147909)*sailStates.p + (8.891840)*sailStates.q + (-0.528682)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-15.013672)*sailStates.alpha + (-0.612098)*sailStates.beta + (8.897080)*sailStates.p + (-136.384674)*sailStates.q + (1.599798)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.256105)*sailStates.alpha + (-0.007862)*sailStates.beta + (0.786409)*sailStates.p + (-4.011209)*sailStates.q + (-0.012191)*sailStates.r + (-0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end