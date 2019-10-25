function [aeroForces] = paramSpace_3_1_3_1_3_1_2(sailStates,airStates)

	CL = (7.189651)*sailStates.alpha + (-0.499696)*sailStates.beta + (-2.506071)*sailStates.p + (31.958385)*sailStates.q + (-2.329101)*sailStates.r + (0.010329)*sailStates.de;
	CD = -2.794950;
	CY = (0.194410)*sailStates.alpha + (-0.022800)*sailStates.beta + (-1.241307)*sailStates.p + (1.693497)*sailStates.q + (0.081419)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (2.743225)*sailStates.alpha + (0.396047)*sailStates.beta + (-1.239897)*sailStates.p + (9.585112)*sailStates.q + (-2.198297)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-17.089382)*sailStates.alpha + (1.922951)*sailStates.beta + (9.376406)*sailStates.p + (-136.946671)*sailStates.q + (7.861557)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.689273)*sailStates.alpha + (-0.042522)*sailStates.beta + (2.811100)*sailStates.p + (-14.317731)*sailStates.q + (-0.034924)*sailStates.r + (-0.000723)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end