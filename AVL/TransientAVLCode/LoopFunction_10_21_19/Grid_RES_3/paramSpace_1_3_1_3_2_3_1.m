function [aeroForces] = paramSpace_1_3_1_3_2_3_1(sailStates,airStates)

	CL = (3.881837)*sailStates.alpha + (0.039172)*sailStates.beta + (-2.187538)*sailStates.p + (30.857904)*sailStates.q + (-0.136041)*sailStates.r + (0.009974)*sailStates.de;
	CD = -0.062530;
	CY = (-0.033584)*sailStates.alpha + (-0.025311)*sailStates.beta + (0.115742)*sailStates.p + (-0.173374)*sailStates.q + (0.020425)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.007768)*sailStates.alpha + (-0.047222)*sailStates.beta + (-0.902570)*sailStates.p + (6.766471)*sailStates.q + (0.062427)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-14.304656)*sailStates.alpha + (-0.181378)*sailStates.beta + (7.810689)*sailStates.p + (-127.559647)*sailStates.q + (0.524182)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.274628)*sailStates.alpha + (-0.004769)*sailStates.beta + (-0.402812)*sailStates.p + (2.436433)*sailStates.q + (-0.032165)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end