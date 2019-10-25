function [aeroForces] = paramSpace_1_2_1_2_1_2_1(sailStates,airStates)

	CL = (3.722504)*sailStates.alpha + (-0.062783)*sailStates.beta + (-2.114133)*sailStates.p + (31.927343)*sailStates.q + (-0.648721)*sailStates.r + (0.010325)*sailStates.de;
	CD = 0.092660;
	CY = (-0.117698)*sailStates.alpha + (-0.023742)*sailStates.beta + (-0.075245)*sailStates.p + (-1.057313)*sailStates.q + (-0.014854)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.967966)*sailStates.alpha + (0.067075)*sailStates.beta + (-0.874251)*sailStates.p + (7.006461)*sailStates.q + (-0.428667)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-13.368010)*sailStates.alpha + (0.259885)*sailStates.beta + (7.165745)*sailStates.p + (-125.069839)*sailStates.q + (2.238733)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.180829)*sailStates.alpha + (0.013658)*sailStates.beta + (0.047778)*sailStates.p + (1.141314)*sailStates.q + (-0.041609)*sailStates.r + (0.000311)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end