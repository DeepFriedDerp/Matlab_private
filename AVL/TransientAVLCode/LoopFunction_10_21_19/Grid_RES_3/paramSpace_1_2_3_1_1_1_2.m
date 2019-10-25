function [aeroForces] = paramSpace_1_2_3_1_1_1_2(sailStates,airStates)

	CL = (5.563739)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.699654)*sailStates.p + (41.999565)*sailStates.q + (-2.683815)*sailStates.r + (0.012271)*sailStates.de;
	CD = -1.816520;
	CY = (-0.236951)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.948375)*sailStates.p + (-1.671348)*sailStates.q + (-0.167383)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.131431)*sailStates.alpha + (0.540871)*sailStates.beta + (-1.250599)*sailStates.p + (11.671987)*sailStates.q + (-2.306726)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-10.390932)*sailStates.alpha + (0.000000)*sailStates.beta + (7.526861)*sailStates.p + (-137.643188)*sailStates.q + (8.931689)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.105714)*sailStates.alpha + (0.095370)*sailStates.beta + (2.035893)*sailStates.p + (-7.374823)*sailStates.q + (-0.008779)*sailStates.r + (0.000281)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end