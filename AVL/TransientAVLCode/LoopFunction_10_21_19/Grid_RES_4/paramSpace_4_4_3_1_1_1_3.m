function [aeroForces] = paramSpace_4_4_3_1_1_1_3(sailStates,airStates)

	CL = (4.731009)*sailStates.alpha + (0.201996)*sailStates.beta + (-3.093951)*sailStates.p + (34.644711)*sailStates.q + (-0.499453)*sailStates.r + (0.009285)*sailStates.de;
	CD = -1.445400;
	CY = (-0.425719)*sailStates.alpha + (-0.017140)*sailStates.beta + (-0.435031)*sailStates.p + (-2.326708)*sailStates.q + (0.086450)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (1.214233)*sailStates.alpha + (0.331733)*sailStates.beta + (-1.722032)*sailStates.p + (13.968080)*sailStates.q + (-0.783217)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-14.052410)*sailStates.alpha + (-0.842119)*sailStates.beta + (11.758435)*sailStates.p + (-155.326050)*sailStates.q + (1.570035)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.535355)*sailStates.alpha + (-0.054537)*sailStates.beta + (1.383266)*sailStates.p + (-5.768418)*sailStates.q + (-0.051093)*sailStates.r + (0.000517)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end