function [aeroForces] = paramSpace_1_2_1_2_1_1_2(sailStates,airStates)

	CL = (4.856322)*sailStates.alpha + (-0.690890)*sailStates.beta + (-5.778383)*sailStates.p + (53.983608)*sailStates.q + (2.138985)*sailStates.r + (0.010971)*sailStates.de;
	CD = -6.513860;
	CY = (2.273255)*sailStates.alpha + (-0.018177)*sailStates.beta + (1.241923)*sailStates.p + (3.866462)*sailStates.q + (0.164050)*sailStates.r + (0.000874)*sailStates.de;

	Cl = (-0.902992)*sailStates.alpha + (-0.892131)*sailStates.beta + (-3.921509)*sailStates.p + (33.682381)*sailStates.q + (2.359509)*sailStates.r + (0.005014)*sailStates.de;
	Cm = (3.664628)*sailStates.alpha + (2.940721)*sailStates.beta + (21.501310)*sailStates.p + (-230.749344)*sailStates.q + (-7.262191)*sailStates.r + (-0.080976)*sailStates.de;
	Cn = (-8.310763)*sailStates.alpha + (-0.090108)*sailStates.beta + (-3.400419)*sailStates.p + (14.528533)*sailStates.q + (-0.070718)*sailStates.r + (-0.000732)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end