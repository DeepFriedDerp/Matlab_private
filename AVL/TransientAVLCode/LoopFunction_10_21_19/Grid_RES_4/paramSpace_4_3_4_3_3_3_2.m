function [aeroForces] = paramSpace_4_3_4_3_3_3_2(sailStates,airStates)

	CL = (4.005742)*sailStates.alpha + (-0.124611)*sailStates.beta + (-2.543440)*sailStates.p + (37.603668)*sailStates.q + (1.535168)*sailStates.r + (0.010968)*sailStates.de;
	CD = -0.115460;
	CY = (0.064739)*sailStates.alpha + (-0.025548)*sailStates.beta + (0.468649)*sailStates.p + (0.489620)*sailStates.q + (-0.093168)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.167044)*sailStates.alpha + (-0.286600)*sailStates.beta + (-1.171584)*sailStates.p + (10.301125)*sailStates.q + (1.219807)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-12.394470)*sailStates.alpha + (0.490970)*sailStates.beta + (7.892096)*sailStates.p + (-135.545776)*sailStates.q + (-5.156888)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.086075)*sailStates.alpha + (0.051255)*sailStates.beta + (-0.869772)*sailStates.p + (2.714775)*sailStates.q + (-0.023651)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end