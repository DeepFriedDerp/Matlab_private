function [aeroForces] = paramSpace_1_1_1_3_2_3_1(sailStates,airStates)

	CL = (3.881837)*sailStates.alpha + (-0.039172)*sailStates.beta + (-2.187538)*sailStates.p + (30.857904)*sailStates.q + (-0.136041)*sailStates.r + (0.009974)*sailStates.de;
	CD = -0.062530;
	CY = (-0.033584)*sailStates.alpha + (-0.024351)*sailStates.beta + (0.115742)*sailStates.p + (-0.173374)*sailStates.q + (0.020425)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.148251)*sailStates.alpha + (-0.056938)*sailStates.beta + (-0.987187)*sailStates.p + (7.827336)*sailStates.q + (0.047406)*sailStates.r + (0.000114)*sailStates.de;
	Cm = (-14.304656)*sailStates.alpha + (0.181378)*sailStates.beta + (7.810689)*sailStates.p + (-127.559647)*sailStates.q + (0.524182)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.287199)*sailStates.alpha + (-0.013598)*sailStates.beta + (-0.417733)*sailStates.p + (2.623492)*sailStates.q + (-0.034814)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end