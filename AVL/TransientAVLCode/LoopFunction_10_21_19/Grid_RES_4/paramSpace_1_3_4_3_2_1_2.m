function [aeroForces] = paramSpace_1_3_4_3_2_1_2(sailStates,airStates)

	CL = (4.228580)*sailStates.alpha + (0.109471)*sailStates.beta + (-2.531181)*sailStates.p + (37.538445)*sailStates.q + (-1.634750)*sailStates.r + (0.011228)*sailStates.de;
	CD = -0.184520;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.503041)*sailStates.p + (-0.000000)*sailStates.q + (-0.100061)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.277966)*sailStates.alpha + (0.286461)*sailStates.beta + (-1.163635)*sailStates.p + (10.319967)*sailStates.q + (-1.252238)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-13.099638)*sailStates.alpha + (-0.377143)*sailStates.beta + (7.753677)*sailStates.p + (-134.847153)*sailStates.q + (5.414633)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.000134)*sailStates.alpha + (0.050000)*sailStates.beta + (0.968477)*sailStates.p + (-3.795251)*sailStates.q + (-0.010668)*sailStates.r + (-0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end