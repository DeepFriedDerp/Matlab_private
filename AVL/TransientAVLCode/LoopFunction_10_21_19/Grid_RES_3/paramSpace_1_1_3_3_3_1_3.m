function [aeroForces] = paramSpace_1_1_3_3_3_1_3(sailStates,airStates)

	CL = (4.316104)*sailStates.alpha + (-0.299981)*sailStates.beta + (-2.771300)*sailStates.p + (39.221786)*sailStates.q + (-1.738343)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.253610;
	CY = (0.023851)*sailStates.alpha + (-0.026342)*sailStates.beta + (-0.587976)*sailStates.p + (0.665002)*sailStates.q + (-0.103613)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.560662)*sailStates.alpha + (0.162239)*sailStates.beta + (-1.422919)*sailStates.p + (12.898811)*sailStates.q + (-1.366149)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-13.294498)*sailStates.alpha + (1.039989)*sailStates.beta + (8.560850)*sailStates.p + (-141.044128)*sailStates.q + (5.770515)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.212234)*sailStates.alpha + (0.048035)*sailStates.beta + (1.110974)*sailStates.p + (-4.761622)*sailStates.q + (-0.001055)*sailStates.r + (-0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end