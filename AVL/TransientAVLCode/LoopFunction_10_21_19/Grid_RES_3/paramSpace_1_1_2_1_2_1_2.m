function [aeroForces] = paramSpace_1_1_2_1_2_1_2(sailStates,airStates)

	CL = (6.499469)*sailStates.alpha + (-0.626333)*sailStates.beta + (-2.637714)*sailStates.p + (42.064354)*sailStates.q + (-3.119690)*sailStates.r + (0.012001)*sailStates.de;
	CD = -2.390350;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.233229)*sailStates.p + (-0.000001)*sailStates.q + (-0.217452)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.989703)*sailStates.alpha + (0.430662)*sailStates.beta + (-1.257113)*sailStates.p + (12.215726)*sailStates.q + (-2.694155)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-11.071090)*sailStates.alpha + (2.369739)*sailStates.beta + (6.949428)*sailStates.p + (-134.612778)*sailStates.q + (10.378050)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.083877)*sailStates.alpha + (0.113588)*sailStates.beta + (2.614873)*sailStates.p + (-11.083076)*sailStates.q + (0.025106)*sailStates.r + (-0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end