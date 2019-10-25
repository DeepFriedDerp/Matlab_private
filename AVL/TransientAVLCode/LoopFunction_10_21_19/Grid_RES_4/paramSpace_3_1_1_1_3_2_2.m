function [aeroForces] = paramSpace_3_1_1_1_3_2_2(sailStates,airStates)

	CL = (4.090877)*sailStates.alpha + (-0.024524)*sailStates.beta + (-2.564542)*sailStates.p + (34.584663)*sailStates.q + (-0.124490)*sailStates.r + (0.010922)*sailStates.de;
	CD = -0.012460;
	CY = (0.207040)*sailStates.alpha + (-0.023516)*sailStates.beta + (-0.221067)*sailStates.p + (1.693498)*sailStates.q + (0.014311)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (1.390356)*sailStates.alpha + (0.033683)*sailStates.beta + (-1.258487)*sailStates.p + (10.285689)*sailStates.q + (-0.166974)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-14.854080)*sailStates.alpha + (0.162992)*sailStates.beta + (8.889361)*sailStates.p + (-136.946671)*sailStates.q + (0.430698)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.317142)*sailStates.alpha + (-0.004768)*sailStates.beta + (0.497371)*sailStates.p + (-3.628972)*sailStates.q + (-0.016265)*sailStates.r + (-0.000503)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end