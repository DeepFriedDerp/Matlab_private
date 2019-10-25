function [aeroForces] = paramSpace_2_1_3_2_3_3_2(sailStates,airStates)

	CL = (4.346809)*sailStates.alpha + (0.209774)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (0.817130)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.355690;
	CY = (0.095711)*sailStates.alpha + (-0.024637)*sailStates.beta + (0.372870)*sailStates.p + (0.771085)*sailStates.q + (0.000072)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.292715)*sailStates.alpha + (-0.168506)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (0.810682)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.411780)*sailStates.alpha + (-0.900113)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-2.818533)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.026940)*sailStates.alpha + (-0.000223)*sailStates.beta + (-0.844947)*sailStates.p + (3.161951)*sailStates.q + (-0.000363)*sailStates.r + (-0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end