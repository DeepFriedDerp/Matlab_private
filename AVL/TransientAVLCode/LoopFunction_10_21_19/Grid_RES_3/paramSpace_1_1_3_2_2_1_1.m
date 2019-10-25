function [aeroForces] = paramSpace_1_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.476239)*sailStates.alpha + (-0.331050)*sailStates.beta + (-2.164658)*sailStates.p + (34.860931)*sailStates.q + (-1.744393)*sailStates.r + (0.011155)*sailStates.de;
	CD = -0.476530;
	CY = (0.067860)*sailStates.alpha + (-0.024222)*sailStates.beta + (-0.605635)*sailStates.p + (-0.267958)*sailStates.q + (-0.106815)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.227195)*sailStates.alpha + (0.212651)*sailStates.beta + (-0.910779)*sailStates.p + (8.136029)*sailStates.q + (-1.410642)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-12.523865)*sailStates.alpha + (1.182153)*sailStates.beta + (6.402895)*sailStates.p + (-123.711861)*sailStates.q + (5.797161)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.438692)*sailStates.alpha + (0.056514)*sailStates.beta + (1.270807)*sailStates.p + (-5.226943)*sailStates.q + (0.003513)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end