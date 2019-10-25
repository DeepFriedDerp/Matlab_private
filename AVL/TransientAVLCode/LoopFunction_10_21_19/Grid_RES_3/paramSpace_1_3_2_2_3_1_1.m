function [aeroForces] = paramSpace_1_3_2_2_3_1_1(sailStates,airStates)

	CL = (4.736006)*sailStates.alpha + (0.380219)*sailStates.beta + (-2.143882)*sailStates.p + (35.029438)*sailStates.q + (-1.950448)*sailStates.r + (0.011049)*sailStates.de;
	CD = -0.628900;
	CY = (0.195064)*sailStates.alpha + (-0.023593)*sailStates.beta + (-0.745994)*sailStates.p + (0.491417)*sailStates.q + (-0.131539)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.336246)*sailStates.alpha + (0.458719)*sailStates.beta + (-0.813294)*sailStates.p + (7.113034)*sailStates.q + (-1.586766)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-12.542537)*sailStates.alpha + (-1.418794)*sailStates.beta + (6.160834)*sailStates.p + (-122.751358)*sailStates.q + (6.493242)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.748959)*sailStates.alpha + (0.057138)*sailStates.beta + (1.568485)*sailStates.p + (-7.151447)*sailStates.q + (0.022063)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end