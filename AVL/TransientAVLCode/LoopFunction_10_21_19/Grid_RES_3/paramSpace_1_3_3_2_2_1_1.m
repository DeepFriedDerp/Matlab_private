function [aeroForces] = paramSpace_1_3_3_2_2_1_1(sailStates,airStates)

	CL = (4.476239)*sailStates.alpha + (0.331050)*sailStates.beta + (-2.164658)*sailStates.p + (34.860931)*sailStates.q + (-1.744393)*sailStates.r + (0.011155)*sailStates.de;
	CD = -0.476530;
	CY = (0.067860)*sailStates.alpha + (-0.025440)*sailStates.beta + (-0.605635)*sailStates.p + (-0.267958)*sailStates.q + (-0.106815)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.095868)*sailStates.alpha + (0.407715)*sailStates.beta + (-0.826127)*sailStates.p + (7.075157)*sailStates.q + (-1.395816)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-12.523865)*sailStates.alpha + (-1.182153)*sailStates.beta + (6.402896)*sailStates.p + (-123.711845)*sailStates.q + (5.797161)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.536904)*sailStates.alpha + (0.052874)*sailStates.beta + (1.285733)*sailStates.p + (-5.414004)*sailStates.q + (0.006127)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end