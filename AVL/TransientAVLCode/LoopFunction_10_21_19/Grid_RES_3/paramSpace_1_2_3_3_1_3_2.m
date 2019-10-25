function [aeroForces] = paramSpace_1_2_3_3_1_3_2(sailStates,airStates)

	CL = (4.116535)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.471925)*sailStates.p + (33.039013)*sailStates.q + (-0.083406)*sailStates.r + (0.010445)*sailStates.de;
	CD = -0.145150;
	CY = (-0.058762)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.203902)*sailStates.p + (-0.491627)*sailStates.q + (0.035907)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.272685)*sailStates.alpha + (-0.082336)*sailStates.beta + (-1.169064)*sailStates.p + (9.315251)*sailStates.q + (0.143400)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-15.130919)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.862748)*sailStates.p + (-136.151047)*sailStates.q + (0.304159)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.307987)*sailStates.alpha + (-0.014518)*sailStates.beta + (-0.610004)*sailStates.p + (3.625404)*sailStates.q + (-0.046115)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end