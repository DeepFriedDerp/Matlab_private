function [aeroForces] = paramSpace_2_1_4_2_1_3_3(sailStates,airStates)

	CL = (4.562321)*sailStates.alpha + (0.219213)*sailStates.beta + (-2.931164)*sailStates.p + (36.686478)*sailStates.q + (0.840333)*sailStates.r + (0.010878)*sailStates.de;
	CD = -0.548150;
	CY = (0.008661)*sailStates.alpha + (-0.024285)*sailStates.beta + (0.532349)*sailStates.p + (-0.668512)*sailStates.q + (0.034821)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.698388)*sailStates.alpha + (-0.183170)*sailStates.beta + (-1.572947)*sailStates.p + (13.031857)*sailStates.q + (0.871394)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-15.030107)*sailStates.alpha + (-0.948954)*sailStates.beta + (10.350533)*sailStates.p + (-147.557632)*sailStates.q + (-2.874449)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.033340)*sailStates.alpha + (-0.018195)*sailStates.beta + (-1.249584)*sailStates.p + (6.391715)*sailStates.q + (-0.018255)*sailStates.r + (0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end