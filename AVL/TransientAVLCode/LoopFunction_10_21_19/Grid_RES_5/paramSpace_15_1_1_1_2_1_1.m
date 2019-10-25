function [aeroForces] = paramSpace_15_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.519208)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.865255)*sailStates.p + (25.325762)*sailStates.q + (-0.586700)*sailStates.r + (0.009241)*sailStates.de;
	CD = -0.765950;
	CY = (0.277186)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.561511)*sailStates.p + (1.423509)*sailStates.q + (0.139846)*sailStates.r + (0.000296)*sailStates.de;

	Cl = (1.200430)*sailStates.alpha + (0.224791)*sailStates.beta + (-0.725634)*sailStates.p + (4.529173)*sailStates.q + (-0.802590)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-16.335119)*sailStates.alpha + (0.000000)*sailStates.beta + (7.780124)*sailStates.p + (-121.603668)*sailStates.q + (1.785085)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (-1.020910)*sailStates.alpha + (-0.056047)*sailStates.beta + (1.375312)*sailStates.p + (-7.489511)*sailStates.q + (-0.097806)*sailStates.r + (-0.000494)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end