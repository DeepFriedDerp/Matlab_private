function [aeroForces] = paramSpace_1_2_2_2_1_1_1(sailStates,airStates)

	CL = (4.276130)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.200857)*sailStates.p + (35.045086)*sailStates.q + (-1.565761)*sailStates.r + (0.011203)*sailStates.de;
	CD = -0.364700;
	CY = (-0.049861)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.505006)*sailStates.p + (-1.027327)*sailStates.q + (-0.089046)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.985724)*sailStates.alpha + (0.293483)*sailStates.beta + (-0.888484)*sailStates.p + (7.639894)*sailStates.q + (-1.278022)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-12.315529)*sailStates.alpha + (0.000000)*sailStates.beta + (6.679975)*sailStates.p + (-125.588745)*sailStates.q + (5.241458)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (-0.300095)*sailStates.alpha + (0.051749)*sailStates.beta + (1.054878)*sailStates.p + (-3.617297)*sailStates.q + (-0.011722)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end