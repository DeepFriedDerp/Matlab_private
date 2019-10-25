function [aeroForces] = paramSpace_4_3_4_3_2_3_3(sailStates,airStates)

	CL = (4.094942)*sailStates.alpha + (-0.135128)*sailStates.beta + (-2.779577)*sailStates.p + (39.821503)*sailStates.q + (1.761902)*sailStates.r + (0.011091)*sailStates.de;
	CD = -0.172800;
	CY = (0.038377)*sailStates.alpha + (-0.024749)*sailStates.beta + (0.577482)*sailStates.p + (-0.194781)*sailStates.q + (-0.114889)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.365357)*sailStates.alpha + (-0.319887)*sailStates.beta + (-1.368327)*sailStates.p + (12.308319)*sailStates.q + (1.405585)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-12.416548)*sailStates.alpha + (0.526044)*sailStates.beta + (8.533309)*sailStates.p + (-141.871536)*sailStates.q + (-5.900341)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.252902)*sailStates.alpha + (0.055998)*sailStates.beta + (-1.057694)*sailStates.p + (3.879749)*sailStates.q + (-0.015333)*sailStates.r + (0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end