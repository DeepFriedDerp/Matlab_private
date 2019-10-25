function [aeroForces] = paramSpace_4_3_1_3_2_3_3(sailStates,airStates)

	CL = (4.190919)*sailStates.alpha + (-0.114045)*sailStates.beta + (-2.781968)*sailStates.p + (39.674999)*sailStates.q + (1.735024)*sailStates.r + (0.011357)*sailStates.de;
	CD = -0.184390;
	CY = (0.033502)*sailStates.alpha + (-0.024789)*sailStates.beta + (0.533896)*sailStates.p + (-0.194782)*sailStates.q + (-0.106178)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.368343)*sailStates.alpha + (-0.297158)*sailStates.beta + (-1.369445)*sailStates.p + (12.301678)*sailStates.q + (1.334471)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-13.022257)*sailStates.alpha + (0.392368)*sailStates.beta + (8.563964)*sailStates.p + (-141.871536)*sailStates.q + (-5.746229)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.235368)*sailStates.alpha + (0.051655)*sailStates.beta + (-0.991982)*sailStates.p + (3.846364)*sailStates.q + (-0.014242)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end