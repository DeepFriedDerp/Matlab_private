function [aeroForces] = paramSpace_13_1_3_2_2_1_2(sailStates,airStates)

	CL = (3.942366)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.684328)*sailStates.p + (35.251133)*sailStates.q + (0.312692)*sailStates.r + (0.010476)*sailStates.de;
	CD = -0.039100;
	CY = (0.023801)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.086429)*sailStates.p + (0.261303)*sailStates.q + (0.015249)*sailStates.r + (0.000056)*sailStates.de;

	Cl = (1.310253)*sailStates.alpha + (0.032792)*sailStates.beta + (-1.340083)*sailStates.p + (11.048142)*sailStates.q + (0.087676)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-14.468328)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.428858)*sailStates.p + (-141.841248)*sailStates.q + (-1.102723)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (-0.233971)*sailStates.alpha + (-0.005782)*sailStates.beta + (0.400987)*sailStates.p + (-2.818233)*sailStates.q + (-0.044534)*sailStates.r + (-0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end