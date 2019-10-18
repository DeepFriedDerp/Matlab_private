function [aeroForces] = paramSpace_1_2_2_2_2_1_2(sailStates,airStates)

	CL = (8.048704)*sailStates.alpha + (-0.603225)*sailStates.beta + (-2.579020)*sailStates.p + (29.082247)*sailStates.q + (0.525274)*sailStates.r + (0.008706)*sailStates.de;
	CD = -5.507250;
	CY = (1.928365)*sailStates.alpha + (-0.004533)*sailStates.beta + (-0.134846)*sailStates.p + (15.704385)*sailStates.q + (-0.013304)*sailStates.r + (0.003346)*sailStates.de;

	Cl = (-2.451646)*sailStates.alpha + (-0.592474)*sailStates.beta + (-1.383208)*sailStates.p + (11.305810)*sailStates.q + (1.196567)*sailStates.r + (0.000360)*sailStates.de;
	Cm = (-11.953998)*sailStates.alpha + (2.896908)*sailStates.beta + (9.433808)*sailStates.p + (-138.530655)*sailStates.q + (-2.040080)*sailStates.r + (-0.068447)*sailStates.de;
	Cn = (-2.067724)*sailStates.alpha + (-0.082530)*sailStates.beta + (-0.306303)*sailStates.p + (-9.993988)*sailStates.q + (0.131951)*sailStates.r + (-0.004443)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end